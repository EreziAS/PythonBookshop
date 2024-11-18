class ObepProtocol:
    def __init__(self):
        self.message = None

    def set_message(self, message):
        self.message = message

    def handle_obep(self):
        obep = self.message.split(';')
        match obep[0]:
            case "LOGIN":
                print("LOGIN")
            case "LOGOUT":
                print("LOGOUT")
            case "GET_AUTHORS":
                print("GET_AUTHORS")
            case "GET_SUBJECTS":
                print("GET_SUBJECTS")
            case "ADD_AUTHOR":
                print("ADD_AUTHOR")
            case "ADD_SUBJECT":
                print("ADD_SUBJECT")
            case "ADD_BOOK":
                print("ADD_BOOK")



