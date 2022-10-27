FROM ruby:3.1.0

RUN apt update  && apt install -y postgresql-client

WORKDIR /learn-rails-app
COPY ./Gemfile /learn-rails-app/Gemfile
COPY ./Gemfile.lock /learn-rails-app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
