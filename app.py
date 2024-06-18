# app.py

from server import SimpleHTTPServer, RequestHandler

# Define route handlers
def home_handler():
    return ("<html><body><h1>Home Page</h1></body></html>")

def about_handler():
    return ("<html><body><h1>About Page</h1></body></html>")

def contact_handler():
    return ("<html><body><h1>Contact Page</h1></body></html>")

def not_found_handler():
    return ("Not Found")

def main():
    # Initialize server
    server = SimpleHTTPServer(port=8080)

    # Add routes directly to the server
    server.add_route("/", home_handler)
    server.add_route("/about", about_handler)
    server.add_route("/contact", contact_handler)

    try:
        # Start server
        server.start()
    except KeyboardInterrupt:
        # Stop server on KeyboardInterrupt
        server.stop()

if __name__ == "__main__":
    main()
