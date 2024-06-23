class HomePageHandler:
    def __init__(self):
        pass

    def response(self):

        html = '''
            <!DOCTYPE html>
            <html>
            <head>
                <style>
                    body {
                        background-color: #f2f2f2;
                        font-family: Arial, sans-serif;
                    }
                    h1 {
                        color: #333;
                        text-align: center;
                    }
                    p {
                        color: #666;
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <h1>Welcome to My Random Website </h1>
                <p>This is the home page of my random website.</p>
            </body>
            </html>
        '''
        return html
