class AboutPageHandler:
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
                <h1>About Us</h1>
                <p>Welcome to our website! We are a team of passionate individuals dedicated to providing high-quality services.</p>
            </body>
            </html>
        '''
        return html


