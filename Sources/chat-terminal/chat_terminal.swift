@main
public struct chat_terminal {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(chat_terminal().text)
    }
}
