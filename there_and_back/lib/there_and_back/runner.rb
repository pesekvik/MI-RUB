require_relative 'input'
require_relative 'city_graph'
require_relative 'solver'
require_relative 'response'
#7. Cesta tam a zase zpátky (KS)
#
#Bylo jednou jedno království, ve kterém ke značné nelibosti místní fauny a flory začala jezdit auta. Jak již tomu bývá, auta jezdí po silnicích, které vedou mezi městy. Všechny silnice v říši jsou však jednosměrné (což neznamená, že nemůže z jednoho města vést jednosměrka do druhého a zároveň zpět.) Časem ale lidé zjistili, že se v některých oblastech začínají hromadit auta, neboť je možné se dostat z jednoho města do druhého, avšak zpět již ani oklikou.
#
#Plynula léta, starého krále vystřídal na trůně jeho druhorozený syn (ten starší si totiž vyjel na obhlídku říše a už nikdy se nevrátil) a rozhodl se dostavět síť silnic tak, aby vedla cesta mezi všemi dvojicemi měst. Svému rádci pro dopravu zadal úkol, aby na přístí zasedání komise pro dopravu připravil seznam silnic, které je třeba dostavět, aby se dalo dostat (byť oklikou) z každého města do všech ostatních. Rádce se navíc rozhodl, že na krále udělá dojem tím, že si připraví seznam nejkratší možný (tedy s nejmenším počtem silnic, i když třeba budou příliš dlouhé). Po krátkém zvažování dospěl, že je to problém pro počítač, a najal vás, abyste mu za drobný bakšiš vytvořili program, který pro zadaný počet měst, počet silnic a jejich seznam nalezne alespoň jedno minimální řešení.
#
#Příklad 1: 5 měst, 3 silnice, <1, 2>, <2, 3>, <3, 4>. Odpověď: Je třeba ještě vybudovat <4, 5>, <5, 1>.
#
#Příklad 2: 3 měst, 4 silnice, <1, 2>, <2, 3>, <3, 2>, <2, 1>. Odpověď: Síť je vyhovující.
module ThereAndBack
	#Handles problem implementation
	class Runner
		#Handles problem implementation
		def run(arguments)
			input = Input.new(arguments)
		  graphs = input.parse
			solver = Solver.new
			response = Response.new
			graphs.each { 
				|graph|  
				response.add_response(graph, solver.solve_one(graph)) 
			}
			return response
		end	
	
	end
end