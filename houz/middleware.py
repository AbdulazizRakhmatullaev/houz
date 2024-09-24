class CurrencyMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        currency = request.session.get('currency', 'UZS')
        request.currency = currency
        response = self.get_response(request)
        return response