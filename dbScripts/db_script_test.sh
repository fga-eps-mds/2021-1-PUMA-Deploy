sudo docker cp ./populate.sql $(sudo docker-compose ps -q db):/popula.sql
sudo docker-compose exec -T db psql -U pumaadmin -d puma -f /popula.sql
