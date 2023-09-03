from locust import HttpUser, between, task


class WebsiteUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def home(self):
        self.client.get("/")

    @task
    def contact(self):
        self.client.get("/de/kontakt")
