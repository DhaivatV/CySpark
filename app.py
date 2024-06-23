# app.py
from server_conf.server import SimpleHTTPServer
from Routes.home import HomePageHandler
from Routes.about import AboutPageHandler

# Define route handlers
def main():
    # Initialize server
    server = SimpleHTTPServer(port=8080)

    # Add routes directly to the server
    server.add_route("/", HomePageHandler().response)
    server.add_route("/about", AboutPageHandler().response)

    try:
        # Start server
        server.start()
    except KeyboardInterrupt:
        # Stop server on KeyboardInterrupt
        server.stop()

if __name__ == "__main__":
    main()
