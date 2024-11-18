# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import socket

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':

    socket_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socket_client.connect(('100.115.91.52', 50050))
    print(socket_client.recv(1024).decode())

    while True:

        to_Send = input()
        socket_client.send(to_Send.encode())

        print(socket_client.recv(1024).decode())




# See PyCharm help at https://www.jetbrains.com/help/pycharm/
