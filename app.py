from dataclasses import dataclass
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from config import pg
from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column

URL = f"postgresql+psycopg2://{pg['username']}:{pg['password']}@localhost:{pg['port']}/{pg['database']}"

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = URL

db = SQLAlchemy(app)

@dataclass
class Questions(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    group_id: Mapped[int] = mapped_column(Integer, nullable=False)
    title: Mapped[str] = mapped_column(String)
    content: Mapped[str] = mapped_column(String)


@app.route("/questions", methods=["GET"])
def question_list():
    questions = Questions.query.all()
    return jsonify(questions)


if __name__ == '__main__':
    db.session.commit()
    app.run()
