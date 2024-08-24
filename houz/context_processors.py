def client_ip(request):
    return {
        'client_ip': request.client_ip,
    }