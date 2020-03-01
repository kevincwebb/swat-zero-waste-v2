# Production DB Setup

docker-compose -f szw.yml run web rake db:create RAILS_ENV=production SECRET_KEY_BASE=... SWAT_ZERO_WASTE_DATABASE_PASSWORD=...

docker-compose -f szw.yml run web rake db:migrate db:seed RAILS_ENV=production SECRET_KEY_BASE=... SWAT_ZERO_WASTE_DATABASE_PASSWORD=...

docker-compose -f szw.yml run web rake assets:precompile RAILS_ENV=production SECRET_KEY_BASE=... SWAT_ZERO_WASTE_DATABASE_PASSWORD=...