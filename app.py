from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_udacity():
	return "Hello, Udacity! This is BLUE DEPLOYMENT!!!"

if __name__ == '__main__':
	app.run()