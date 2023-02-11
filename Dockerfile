FROM alexberkovich/alpine-anaconda3:latest
LABEL maintainer="lhotakj@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app/app.py"]
