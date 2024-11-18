import os

from Utils.socketUtils import SocketUtils
from dotenv import load_dotenv

from Utils.threadClient.threadClient import ThreadClient

if __name__ == '__main__':
    load_dotenv()
    socket_utils = SocketUtils()


    # Create server socket, bind, listen
    serv_soc = socket_utils.get_socket()
    print(serv_soc)


    threads = []
    for _ in range(int(os.getenv("max_workers"))):
        print(f"Server: Thread {_} started")
        thread = ThreadClient(serv_soc)
        thread.start()
        threads.append(thread)

    try:
        for thread in threads:
            thread.join()
    except KeyboardInterrupt:
        print("\nArrêt du serveur...")
    finally:
        serv_soc.close()

