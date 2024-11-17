# Project used to learn Python

##  Introduction
This project is my way to learn of python works. I've never used Python in my life but I'm commited to learn it.\
The base of this project is based on the conception of multiple servers and clients, using threading, networking libraries etc.. 

## Presentation
The goal of this project is to create a collections of client-server used for a bookshop. \
In the infra, we'll have two servers:
    
1. One used to manage the stocks, adding and retrieving data from database.
2. One used to manage all the "shopping" part of the project, used by the client to buy books.

Added to this, we'll find 4 clients:

1. The client used by the vendor to add different books to the database, connected to the server 1.
2. The client used by the vendor in his shop, search for books, create cart. Connected to the server 2.
3. The client used by the client, used when a client has already some credentials. Connected to the serve 2 but using secured communications.
4. The web client.

## Additional infos:
This project is based on the school project from the HEPL in 2024-2025. \
This project is aimed to be programmed in C/Java. \
The database used is a Postgres database, I've never worked with, but I've some experience with relational database (MySQL/MariaDB).