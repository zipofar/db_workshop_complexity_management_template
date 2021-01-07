test:
	rails test

setup:
	bin/setup
	rails db:fixtures:load

fixtures-load:
	rails db:fixtures:load

clean:
	rails db:drop

db-reset:
	rails db:drop
	rails db:create
	rails db:migrate
	rails db:fixtures:load

start:
	rails server

lint:
	bundle exec rubocop

linter-fix:
	bundle exec rubocop --auto-correct

.PHONY: test
