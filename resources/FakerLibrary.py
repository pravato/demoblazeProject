from faker import Faker


class FakerLibrary:
    def __init__(self):
        self.fake = Faker()

    def get_fake_username(self):
        return self.fake.user_name()

    def get_fake_password(self):
        return self.fake.numerify(text="######")

    def get_fake_name(self):
        return self.fake.name()

    def get_fake_country(self):
        return self.fake.country()

    def get_fake_city(self):
        return self.fake.city()

    def get_fake_card(self):
        return self.fake.credit_card_number()

    def get_fake_month(self):
        return self.fake.month()

    def get_fake_year(self):
        return self.fake.year()
