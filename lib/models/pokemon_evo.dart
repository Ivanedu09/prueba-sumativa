class pokemonEvo {
	int baseExperience;
	List<Forms> forms;
	List<Null> gameIndices;
	int height;
	int id;
	bool isDefault;
	String name;
	int order;
	Forms species;
	List<Null> stats;
	int weight;

	pokemonEvo({this.baseExperience, this.forms, this.gameIndices, this.height, this.id, this.isDefault, this.name, this.order, this.species, this.sprites, this.stats, this.types, this.weight});

	pokemonEvo.fromJson(Map<String, dynamic> json) {
		baseExperience = json['base_experience'];
		if (json['forms'] != null) {
			forms = new List<Forms>();
			json['forms'].forEach((v) { forms.add(new Forms.fromJson(v)); });
		}
		if (json['game_indices'] != null) {
			gameIndices = new List<Null>();
			json['game_indices'].forEach((v) { gameIndices.add(new Null.fromJson(v)); });
		}
		height = json['height'];
		id = json['id'];
		isDefault = json['is_default'];
		name = json['name'];
		order = json['order'];
		species = json['species'] != null ? new Forms.fromJson(json['species']) : null;
		sprites = json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
		if (json['stats'] != null) {
			stats = new List<Null>();
			json['stats'].forEach((v) { stats.add(new Null.fromJson(v)); });
		}
		
		weight = json['weight'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['base_experience'] = this.baseExperience;
		if (this.forms != null) {
      data['forms'] = this.forms.map((v) => v.toJson()).toList();
    }
		if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices.map((v) => v.toJson()).toList();
    }
		data['height'] = this.height;
		data['id'] = this.id;
		data['is_default'] = this.isDefault;
		data['name'] = this.name;
		data['order'] = this.order;
		if (this.species != null) {
      data['species'] = this.species.toJson();
    }
		if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
		if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
		
		data['weight'] = this.weight;
		return data;
	}
}

class Forms {
	String name;
	String url;

	Forms({this.name, this.url});

	Forms.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['url'] = this.url;
		return data;
	}
}
class Sprites {


	Sprites({});

	Sprites.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
