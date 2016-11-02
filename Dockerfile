FROM ubuntu:16.04
RUN sed -i'~' -E "s@http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu@http://ftp.jaist.ac.jp/pub/Linux/ubuntu@g" /etc/apt/sources.list
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential \
    curl \
    git-core \
    libcurl4-openssl-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    zlib1g-dev && \
    curl -O http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz && \
    tar -zxvf ruby-2.3.1.tar.gz && \
    cd ruby-2.3.1 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.3.1 ruby-2.3.1.tar.gz && \
    echo 'gem: --no-document' > /usr/local/etc/gemrc


# Install Bundler for each version of ruby
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get -y install mysql-server mysql-client libmysqlclient-dev
RUN \
  echo 'gem: --no-rdoc --no-ri' >> /.gemrc && \
  gem install bundler

ENV APP_ROOT /usr/src/Blog

WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle config without test development doc
RUN bundle install
COPY . $APP_ROOT

ENV SECRET_KEY_BASE RUN ["bundle", "exec", "rake", "secret"]
RUN bundle exec rake assets:precompile
#RUN bundle exec rake db:seed
ENV RAILS_ENV production
#RUN bundle exec rake db:create
#RUN bundle exec rake db:migrate

# Add configuration files in repository to filesystem
RUN rm -rf /usr/src/Blog/tmp/pids/server.pid
