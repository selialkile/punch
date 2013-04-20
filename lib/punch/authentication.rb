# -*- encoding : utf-8 -*-
module Punch
	module Authentication
		def authenticate login, password
			response = post('/login',{'login' => login, 'senha' => password,"B1" => 'Entrar'}, true)
			if response.headers["set-cookie"].match(/pl=[a-z0-9]+/)
				response.headers["set-cookie"]
			else
				raise InvalidLogin, "Login invalid"
			end
		end
	end
end
