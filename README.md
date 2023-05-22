<h1>Trading app</h1>
This project is presented in educational purposes and shows my abilities with FastAPI framework.
<h2>General Info</h2>
In this project is realized a fundament of a web application for tracking your portfolio in special application for investments.
<h2>Technologies</h2>
This project includes:

- connection with databases (PostgreSQL, Redis)
- database migrations (Alembic)
- data validation (Pydantic)
- users authentication (Fastapi-users)
- requests caching (Redis)
- pending tasks (Celery + Redis + Flower)
- testing (Pytest)
- API visualisation (Jinja)

## Setup

For local testing:
1. Install all requirements with command `pip install -r requirements.txt`
2. Enter `uvicorn src.main:app --reload` for loading uvicorn server
3. Follow this link http://localhost:8000/docs to see all available endpoints

For Docker:
1. Install Docker
2. Firstly, you need to build your 'Docker Compose' with command `docker compose build`
3. After that, you need to run it with command `docker compose up`