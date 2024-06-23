# app.py
from cyspark.app import App
from Routes.home import HomePageHandler
from Routes.about import AboutPageHandler

# Define route handlers
def main():
    # Initialize server
    __app__ = App(port=8080)

    # Add routes directly to the server
    __app__.add_route("/", HomePageHandler().response)
    __app__.add_route("/about", AboutPageHandler().response)

    try:
        # Start server
        __app__.start()
    except KeyboardInterrupt:
        # Stop server on KeyboardInterrupt
        __app__.stop()

if __name__ == "__main__":
    main()
