class HelloWorld():
    """
    Hello World class to demonstrate robot layout
    The library scope ensures only 1 instance of the class across a test suite,
    reducing the chance of mismanaging state.
    """

    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    def get_msg(self):
        return "hello world"
