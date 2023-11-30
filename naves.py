class Spaceship:
    def __init__(self, name, model, manufacturer):
        self.name = name
        self.model = model
        self.manufacturer = manufacturer

class Fleet:
    def __init__(self):
        self.spaceships = []

    def add_spaceship(self, spaceship):
        self.spaceships.append(spaceship)

    def edit_spaceship(self, index, name, model, manufacturer):
        self.spaceships[index].name = name
        self.spaceships[index].model = model
        self.spaceships[index].manufacturer = manufacturer

    def delete_spaceship(self, index):
        del self.spaceships[index]

    def search_spaceships(self, name=None, model=None, manufacturer=None):
        result = []
        for spaceship in self.spaceships:
            if (name is None or spaceship.name == name) and \
               (model is None or spaceship.model == model) and \
               (manufacturer is None or spaceship.manufacturer == manufacturer):
                result.append(spaceship)
        return result

class Mission:
    def __init__(self, name, date, spaceships):
        self.name = name
        self.date = date
        self.spaceships = spaceships

class MissionLog:
    def __init__(self):
        self.missions = []

    def add_mission(self, mission):
        self.missions.append(mission)

    def search_missions(self, name=None, date=None, spaceships=None):
        result = []
        for mission in self.missions:
            if (name is None or mission.name == name) and \
               (date is None or mission.date == date) and \
               (spaceships is None or set(mission.spaceships) == set(spaceships)):
                result.append(mission)
        return result
