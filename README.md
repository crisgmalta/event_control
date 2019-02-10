# API para CRUD para eventos

## Comments
#### listar todos os comentarios:
GET http://localhost:3000/comments
#### listar comentario especifico
GET http://localhost:3000/comments/1
#### criar comentario
POST http://localhost:3000/comments
```json
{ "comment": { "text": "A sample comment", "user_id": 1, "event_id": 1, "denounce": false } }
```
#### atualizar comentario
PUT http://localhost:3000/comments
```json
{ "comment": { "text": "A sample comment", "user_id": 1, "event_id": 1, "denounce": false } }
```
#### deletar comentario
DELETE http://localhost:3000/comments/1

## Events 
#### listar todos os eventos
GET http://localhost:3000/events
#### listar evento especifico
GET http://localhost:3000/events/1
#### criar evento
POST http://localhost:3000/events
```json
{ "event": { "name": "An event", "description": "Georgetown", "lat": 31159238, "lng": 15930673 } }
```
#### atualizar evento
PUT http://localhost:3000/events
```json
{ "event": { "name": "An event", "description": "Georgetown", "lat": 31159238, "lng": 15930673 } }
```
#### deletar evento
DELETE http://localhost:3000/events/1

## User
#### listar todos os usuarios
GET http://localhost:3000/users
#### listar usuario especifico
GET http://localhost:3000/users/1
#### criar usuario
POST http://localhost:3000/users
```json
{ "user": { "name": "Philip Kirlin", "email": "maryrose@strackewilliamson.biz", "password": "S2EsUuC559" } }
```
#### atualizar usuario
PUT GET http://localhost:3000/users
```json
{ "user": { "name": "Philip Kirlin", "email": "maryrose@strackewilliamson.biz", "password": "S2EsUuC559" } }
```
#### deletar usuario
DELETE http://localhost:3000/users/1

## Report
#### listar todos os reports
GET http://localhost:3000/reports
#### listar report especifico
GET http://localhost:3000/reports/1
#### listar report em pdf
GET http://localhost:3000/reports/pdf
#### criar report
POST http://localhost:3000/reports
```json
{ "report": { "user_id": 1, "comment_id": 1 } }
```
#### atualizar report
PUT http://localhost:3000/reports
```json
{ "report": { "user_id": 1, "comment_id": 1 } }
```
#### deletar report
DELETE http://localhost:3000/reports/1

# Dependencias
* ruby 2.4.4

# Setup do projeto
Para configuar este projeto clone este repositorio e execute
* bundle install 
* rails db:create
* rails db:migrate 
* rails db:seed
* rails s (API estará disponível na porta 3000)

# Como executar testes
* rake spec
* rspec spec/controllers/comments_controller_spec.rb

# Como gerar relatorio 
http://localhost:3000/reports/pdf

##### Com filtro para comentarios denunciados
http://localhost:3000/reports/pdf?denounce=true

##### Com filtro para comentarios não denunciados
http://localhost:3000/reports/pdf?denounce=false
