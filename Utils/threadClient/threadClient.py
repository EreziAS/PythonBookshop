import threading
from socket import socket

from Utils.socketUtils import SocketUtils

class ThreadClient(threading.Thread):
    def __init__(self, socket_server):
        threading.Thread.__init__(self)
        self.socket_server = socket_server
        self.socket_utils = SocketUtils()
        self.client_address= None

    def run(self):
        while True:
            print(f"Thread {threading.get_ident()}: waiting for connection...\n")
            handle_client, self.client_address = self.socket_server.accept()
            print(f"Thread {threading.get_ident()}: connected to: {self.client_address}")
            self.client_handler(handle_client)
            print(f"Thread {threading.get_ident()}: Client disconnected")

    def client_handler(self, client_socket):
        print(client_socket)
        self.socket_utils.set_socket_client(client_socket)
        self.socket_utils.send("Connected")
        while True:
            response = self.socket_utils.recv()
            print(f"Thread {threading.get_ident()}: "+response)

            if response == "BYE":
                self.socket_utils.send("OK BYE")
                break
            self.socket_utils.send("Server OK:")
