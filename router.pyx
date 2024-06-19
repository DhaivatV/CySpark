cdef class Router:
    cdef dict routes

    def __init__(self):
        self.routes = {}  # Dictionary to store routes and handlers

    def add_route(self, path: str, handler: callable):
        self.routes[path.encode()] = handler  # Store path as bytes for consistency

    def handle_request(self, path: str):
        encoded_path = path.encode()  # Encode path to bytes
        func = self.routes.get(encoded_path)
        if func:
            return func()
        else:
            return None
