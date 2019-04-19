all: create_proxy_network up_proxy up_website up_rcc

create_proxy_network:
	-docker network create webproxy

delete_proxy_network:
	-docker network rm webproxy

up_proxy:
	docker-compose -f docker-compose-proxy.yaml up -d

down_proxy:
	docker-compose -f docker-compose-proxy.yaml down

up_rcc:
	docker-compose -f docker-compose-rcc.yaml up -d

down_rcc:
	docker-compose -f docker-compose-rcc.yaml down

up_website:
	docker-compose -f docker-compose-website up -d

down_website:
	docker-compose -f docker-compose-website down
