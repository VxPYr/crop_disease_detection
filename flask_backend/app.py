from flask import Flask, request, jsonify
from PIL import Image
import io

app = Flask(__name__)

@app.route('/')
def home():
    return "Crop Disease Detection API is running!"

@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return jsonify({'error': 'No image part in the request'}), 400

    image_file = request.files['image']

    if image_file.filename == '':
        return jsonify({'error': 'No selected image'}), 400

    try:
        # Read the image using Pillow
        image = Image.open(image_file.stream)

        # Do your image analysis here
        # For now, just a placeholder result
        result = {
            'disease': 'Blight',
            'confidence': '95%'
        }

        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
