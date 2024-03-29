all: create_proxy_network up_proxy up_website up_stats up_rcc up_shield

down: down_shield down_rcc down_website down_stats down_proxy delete_proxy_network

create_proxy_network:
	-docker network create webproxy

delete_proxy_network:
	-docker network rm webproxy

up_proxy:
	docker-compose -f docker-compose-proxy.yaml up -d

down_proxy:
	docker-compose -f docker-compose-proxy.yaml down

logs_proxy:
	docker-compose -f docker-compose-proxy.yaml logs --tail=50 -f

up_rcc:
	docker-compose -f docker-compose-rcc.yaml up -d

down_rcc:
	docker-compose -f docker-compose-rcc.yaml down

logs_rcc:
	docker-compose -f docker-compose-rcc.yaml logs --tail=50 -f

up_website:
	docker-compose -f docker-compose-website.yaml up -d

down_website:
	docker-compose -f docker-compose-website.yaml down

logs_website:
	docker-compose -f docker-compose-website.yaml logs --tail=50 -f

up_stats:
	docker-compose -f docker-compose-stats.yaml up -d

down_stats:
	docker-compose -f docker-compose-stats.yaml down

logs_stats:
	docker-compose -f docker-compose-stats.yaml logs --tail=50 -f

clean_stats:
	sudo rm -rf /dockervols/nginx-cache/jscache

up_shield:
	docker-compose -f docker-compose-shield.yaml up -d

down_shield:
	docker-compose -f docker-compose-shield.yaml down

logs_shield:
	docker-compose -f docker-compose-shield.yaml logs --tail=50 -f
