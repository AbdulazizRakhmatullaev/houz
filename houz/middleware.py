class CurrencyMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        currency = request.session.get('currency', 'UZS')
        request.currency = currency
        response = self.get_response(request)
        return response
        
class GetClientIPMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')

        # Attach the IP address to the request object
        request.client_ip = ip

        response = self.get_response(request)
        return response