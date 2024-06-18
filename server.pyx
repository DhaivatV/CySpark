# server.pyx

from http.server import BaseHTTPRequestHandler, HTTPServer
from router import Router

# Define RequestHandler class
class RequestHandler(BaseHTTPRequestHandler):

    def __init__(self, request, client_address, server):
        self.router_obj = Router()  # Access the router object from the server instance
        super().__init__(request, client_address, server)

    def do_GET(self):
        mapping = {b'/': "home", b'/about': "about", b'/contact': "contact"}
        print(mapping.get(self.path.encode('utf-8')))
        message = self.router_obj.handle_request(self, self.path.encode('utf-8'))  # Pass both the handler and the URL
        if message:
            self.send_response(200, message)
        else:
            self.send_response(404, "Not Found")
        

    def send_response(self, code=400, message=None):
        super().send_response(code)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        if message:
            self.wfile.write(message.encode('utf-8'))

cdef class SimpleHTTPServer:

    cdef object server
    cdef int port
    cdef object router_obj

    def __init__(self, int port=8080):
        self.port = port
        self.router_obj = Router()
        self.server = HTTPServer(('0.0.0.0', port), RequestHandler)
        self.server.RequestHandlerClass.server_instance = self  # Pass server instance to RequestHandler

    def start(self):
        print(f"Starting server on port {self.port}")
        self.server.serve_forever()

    def add_route(self, str path, object handler):
        self.router_obj.add_route(path.encode('utf-8'), handler)

    def stop(self):
        self.server.shutdown()
        print("Server stopped")
