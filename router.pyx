# router.pyx

cdef class Router:
    cdef dict routes

    def __init__(self):
        self.routes = {}

    def add_route(self, bytes pattern, object handler):
        print("Adding route:", pattern, handler)
        self.routes[pattern] = handler
        print("Routes:", self.routes)

    def handle_request(self, handler, bytes url):
        func = self.routes.get(url, None)        
        if func is not None:
            return func()
        else:
            return None     
    