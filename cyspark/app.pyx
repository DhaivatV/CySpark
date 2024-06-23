from http.server import BaseHTTPRequestHandler, HTTPServer
from cyspark.router import Router

# Custom HTTPServer class to include router_obj
class CustomHTTPServer(HTTPServer):
    def __init__(self, server_address, RequestHandlerClass, router_obj):
        super().__init__(server_address, RequestHandlerClass)
        self.router_obj = router_obj

# Define RequestHandler class
class RequestHandler(BaseHTTPRequestHandler):
    def __init__(self, request, client_address, server):
        self.router_obj = server.router_obj  # Access the router object from the server instance
        super().__init__(request, client_address, server)

    def do_GET(self):

        message = self.router_obj.handle_request(self.path)  # Pass only the URL
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

cdef class App:
    cdef object server
    cdef int port
    cdef object router_obj

    def __init__(self, int port=8080):
        self.port = port
        self.router_obj = Router()
        self.server = CustomHTTPServer(('0.0.0.0', port), RequestHandler, self.router_obj)

    def start(self):
        print("Welcome to CySpark Server 🤗🤗 !!\nServer in up and running at url: http://localhost:8080 🎉🎉")
        print(f"Starting server on port {self.port}")
        self.server.serve_forever()

    def add_route(self, path: str, handler: callable):
        self.router_obj.add_route(path, handler)
        

    def stop(self):
        self.server.shutdown()
        print("Server stopped")
