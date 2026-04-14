FROM python:3.13-slim

WORKDIR /app

COPY pyproject.toml poetry.lock ./
COPY src ./src

RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

CMD ["python", "-m", "src.main"]