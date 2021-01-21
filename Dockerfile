FROM discourse/discourse_dev:release

# ENV USER=discourse
ENV RUBY_GLOBAL_METHOD_CACHE_SIZE=131072
ENV LD_PRELOAD=/usr/lib/libjemalloc.so
# ENV RAILS_ENV=production

ADD . /src

WORKDIR /src

# "${SCRIPTPATH}/bundle" install part from boot_dev
RUN bundle install

CMD ["bin/unicorn"]