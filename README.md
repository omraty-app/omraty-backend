# Omraty Backend

Backend Spring Boot pour l'application OMRATY (module Authentification en cours).

Conventions reprises du backend sehdini (`auth-identity`), adaptées à un projet monolithe standalone :
JDBC (`JdbcTemplate`, pas de JPA), JWT access + refresh (refresh token persisté en base, révocable, avec rotation),
BCrypt, DTOs en `record`, Flyway pour les migrations.

## Structure

```
src/main/java/com/omraty/backend/
  config/                 configuration Spring (sécurité, beans...)
  domain/                 logique métier (services)
  exception/              exceptions typées + error codes + handler global
  messaging/              DTOs (record) échangés via l'API
  persistence/repository/ accès JDBC à la base
  persistence/tables/     constantes SQL par table
  web/                    contrôleurs REST
```

## Lancer en local

Prérequis : Java 21, PostgreSQL.

```bash
createdb omraty
./gradlew bootRun
```

Variables d'environnement (voir `application.yml`) : `DB_URL`, `DB_USERNAME`, `DB_PASSWORD`, `JWT_SECRET`,
`JWT_ACCESS_EXP_MINUTES`, `JWT_REFRESH_EXP_DAYS`.

## État actuel

- [x] Setup projet + migrations `users` / `refresh_tokens`
- [ ] Couche persistance (`UsersTable`, `RefreshTokensTable`, `AuthRepository`)
- [ ] `JwtUtil`
- [ ] `AuthService` (register / login / refresh / logout)
- [ ] `AuthController`
- [ ] Gestion des erreurs (`AuthErrorCode` + `GlobalExceptionHandler`)
- [ ] `PATCH /users/me/identity`
- [ ] Nettoyage automatique des refresh tokens expirés
- [ ] Tests unitaires `AuthService`

Détail de chaque tâche : voir le board Trello du projet.
