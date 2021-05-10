test:
	bundle exec rails test

setup:
	bin/setup

fixtures-load:
	rails db:fixtures:load

clean:
	rails db:drop

db-reset:
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:fixtures:load

lint:
	bundle exec rubocop

linter-fix:
	bundle exec rubocop --auto-correct

into:
	docker-compose run --rm web bash

ci-check:
	make setup
	make lint
	make test

.PHONY: test
