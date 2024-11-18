import os
import socket
from dotenv import load_dotenv


class SocketUtils:

    def __init__(self):
        self.socket_client = None
        self.socket_server = None

    def set_socket_client(self, socket_client):
        self.socket_client = socket_client

    def get_socket(self):
        print("Get Socket entered")
        load_dotenv()
        self.socket_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket_server.bind((socket.gethostname(), int(os.getenv("port_srv_data"))))
        self.socket_server.listen(5)
        print(f"Server ip: {self.socket_server.getsockname()[0]}")
        print(f"Serve: Listening on port {os.getenv('port_srv_data')}")
        return self.socket_server

    def send(self, message):
        self.socket_client.send(message.encode())

    def recv(self):
        return self.socket_client.recv(4096).decode()
