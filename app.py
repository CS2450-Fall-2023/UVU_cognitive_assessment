from dataclasses import dataclass

from flask import Flask, jsonify, make_response, request
from flask_sqlalchemy import SQLAlchemy
from os import environ

from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('DB_URL')
db = SQLAlchemy(app)


@dataclass
class Questions(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    group_id: Mapped[int] = mapped_column(Integer, nullable=False)
    next_group_id: Mapped[int] = mapped_column(Integer, nullable=False)
    title: Mapped[str] = mapped_column(String)
    content: Mapped[str] = mapped_column(String)

@dataclass
class form_answers(db.Model):
    __tablename__ = 'form_answers'
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    first_name: Mapped[str] = mapped_column(String)
    last_name: Mapped[str] = mapped_column(String)
    cognitive_function: Mapped[str] = mapped_column(String)
    favorite_color: Mapped[str] = mapped_column(String)


# Check if app is running
@app.route('/')
def hello_world():
    return 'Hello World!'

# get all questions
@app.route("/questions", methods=["GET"])
def question_list():
    questions = Questions.query.all()

    response = make_response(jsonify(questions), 200)
    response.headers.add('Content-Type', 'application/json')
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


# get a question by group_id
@app.route('/questions/<int:id>', methods=['GET'])
def question_id(id):
  try:
    questions = Questions.query.filter_by(group_id=id).all()
    if questions:
      response = make_response(jsonify(questions), 200)
      response.headers.add('Content-Type', 'application/json')
      response.headers.add("Access-Control-Allow-Origin", "*")
      return response
    return make_response(jsonify({'message': 'group id not found'}), 404)
  except Exception as e:
    return make_response(print(e), 500)
  

# create a form
@app.route('/forms', methods=['POST'])
def create_form_answers():
  try:
    data = request.get_json()
    new_form_answer = form_answers(
       first_name=data['first_name'],
       last_name=data['last_name'],
       cognitive_function=data['cognitive_function'],
       favorite_color= data['favorite_color']
    )
    db.session.add(new_form_answer)
    db.session.commit()
    return make_response(jsonify({'message': 'form created'}), 201)
  except Exception as e:
    app.logger.error(f"Error creating form: {e}")
    return make_response({'message': 'error creating form'}, 500)
  
# get form
@app.route("/forms", methods=["GET"])
def form_list():
    forms = form_answers.query.all()
    return jsonify(forms)

# get a form answer by id
@app.route('/forms/<int:id>', methods=['GET'])
def form_answer_by_id(id):
  try:
    form_answer = form_answers.query.filter_by(id=id).first()
    if form_answer:
      return make_response(jsonify(form_answer), 200)
    return make_response(jsonify({'message': 'group id not found'}), 404)
  except Exception as e:
    return make_response(print(e), 500)
  
if __name__ == '__main__':
    db.session.commit()
    app.run()
