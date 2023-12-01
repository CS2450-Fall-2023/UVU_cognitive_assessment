from flask import Flask, request, jsonify, make_response
from flask_sqlalchemy import SQLAlchemy
from os import environ
from sqlalchemy.dialects.postgresql import JSON, JSONB, insert 

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('DB_URL')
db = SQLAlchemy(app)

class Test(db.Model):
    __tablename__ = 'Test'
    id = db.Column(db.Integer, primary_key=True)
    questions = db.Column(JSONB, unique=False, nullable=False)
    
    #def json(self):
    #    return {'id': self.id,'username': self.username, 'email': self.email}
    
db.create_all()

# Check if app is running
@app.route('/')
def hello_world():
    return 'Hello World!'


# create a test
@app.route('/tests', methods=['POST'])
def create_test():
  try:
    data = request.get_json()
    new_test = Test(questions=data)
    db.session.add(new_test)
    db.session.commit()
    return make_response(jsonify({'message': 'test created'}), 201)
  except Exception as e:
    print(e)
    return make_response(print(e), 500)
  
# get all tests
@app.route('/tests', methods=['GET'])
def get_test():
  try:
    tests = Test.query.all()
    return make_response(jsonify([test.questions for test in tests]), 200)
  except Exception as e:
    return make_response(jsonify({'message': str(e)}), 500)
  
''' Can be implemented later if needed
# get a user by id
@app.route('/users/<int:id>', methods=['GET'])
def get_user(id):
  try:
    user = User.query.filter_by(id=id).first()
    if user:
      return make_response(jsonify({'user': user.json()}), 200)
    return make_response(jsonify({'message': 'user not found'}), 404)
  except Exception as e:
    print(e)
    return make_response(jsonify({'message': 'error getting user'}), 500)

# update a user
@app.route('/users/<int:id>', methods=['PUT'])
def update_user(id):
  try:
    user = User.query.filter_by(id=id).first()
    if user:
      data = request.get_json()
      user.username = data['username']
      user.email = data['email']
      db.session.commit()
      return make_response(jsonify({'message': 'user updated'}), 200)
    return make_response(jsonify({'message': 'user not found'}), 404)
  except Exception as e:
    print(e)
    return make_response(jsonify({'message': 'error updating user'}), 500)
  
# delete a user
@app.route('/users/<int:id>', methods=['DELETE'])
def delete_user(id):
  try:
    user = User.query.filter_by(id=id).first()
    if user:
      db.session.delete(user)
      db.session.commit()
      return make_response(jsonify({'message': 'user deleted'}), 200)
    return make_response(jsonify({'message': 'user not found'}), 404)
  except Exception as e:
    print(e)
    return make_response(jsonify({'message': 'error deleting user'}), 500)'''