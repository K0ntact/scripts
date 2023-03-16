import openai

openai.api_key = "YOUR_API_KEY"

memory = []


class BCOLORS:
    HEADER = '\033[95m'
    GREEN = '\033[92m'
    RED = '\033[91m'
    BLUE = '\033[94m'
    ENDC = '\033[0m'
    YELLOW = '\033[93m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def main():
    while True:
        print("\nChatGPT CLI")
        print("-"*20)
        print(f"[{BCOLORS.YELLOW}1{BCOLORS.ENDC}]. Chat with GPT-3")
        print(f"[{BCOLORS.YELLOW}2{BCOLORS.ENDC}]. Exit")
        print("-"*20)
        choice = input("Enter your choice: ")
        if choice == "1":
            while True:
                content = input(f"{BCOLORS.YELLOW}Enter your message{BCOLORS.ENDC} ({BCOLORS.RED}x{BCOLORS.ENDC} to exit): ")
                if content == "x":
                    break

                memory.append({"role": "user", "content": content})
                result = openai.ChatCompletion.create(
                    model="gpt-3.5-turbo",
                    messages=memory
                )
                memory.append({"role": "assistant", "content": result["choices"][0]["message"]["content"]})
                print(result["choices"][0]["message"]["content"])
        elif choice == "2":
            break
        else:
            print("Invalid choice")

if __name__ == "__main__":
    main()