from dataclasses import dataclass

from flask import Flask, jsonify, make_response
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


# Check if app is running
@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route("/questions", methods=["GET"])
def question_list():
    questions = Questions.query.all()
    return jsonify(questions)


# get a question by group_id
@app.route('/questions/<int:id>', methods=['GET'])
def question_id(id):
  try:
    questions = Questions.query.filter_by(group_id=id).all()
    if questions:
      return make_response(jsonify(questions), 200)
    return make_response(jsonify({'message': 'group id not found'}), 404)
  except Exception as e:
    return make_response(print(e), 500)


if __name__ == '__main__':
    db.session.commit()
    app.run()
