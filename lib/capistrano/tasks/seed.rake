# desc "ejecutar semilla de la base de datos"
# task :semilla do
#     exec("rake db:seed RAILS_ENV=production")
# end

namespace :deploy do
    desc "reload the database with seed data"
    task :semilla do
        on roles(:all) do
            within release_path do
                execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
            end
        end
    end
end

after "deploy:migrate", "semilla"