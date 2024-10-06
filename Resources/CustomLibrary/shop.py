
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


class shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def select_multiple_item_and_checkout(self, productList):
        productTitles = self.selLib.get_webelements("css:.card-title")
        i = 1
        for productTitle in productTitles:
            if productTitle.text in productList:
                self.selLib.click_button("xpath:(//*[@class='btn btn-info'])["+ str(i) +"]")
            i = i + 1

        self.selLib.click_link("css:.active a")