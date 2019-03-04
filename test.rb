require 'Nokogiri'
require 'open-uri'
require 'byebug'

Plants = [
  {
   "name": "Amydrium zippelianum",
   "url": "https://garden.org/plants/view/456681/"
  },
  {
   "name": "Anthurium lappoanum",
   "url": "https://garden.org/plants/view/701883/"
  },
  {
   "name": "Ardisia guianensis",
   "url": "https://garden.org/plants/view/361526/"
  },
  {
   "name": "Asparagus aethiopicus",
   "url": "https://garden.org/plants/view/214057/"
  },
  {
   "name": "Aspidistra grandiflora",
   "url": "https://garden.org/plants/view/429112/"
  },
  {
   "name": "Aspidistra longipedunculata",
   "url": "https://garden.org/plants/view/385815/"
  },
  {
   "name": "Aspidistra sichuanensis",
   "url": "https://garden.org/plants/view/700109/"
  },
  {
   "name": "Asplenium",
   "url": "https://garden.org/plants/view/720193/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/176016/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/770422/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/611600/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/170404/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/690197/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/640511/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/640558/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/681239/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/737389/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/122438/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/665375/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/717152/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/693809/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/126843/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/680323/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/778429/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/688756/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/698221/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/765128/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/537960/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/678277/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/717278/"
  },
  {
   "name": "Begonia",
   "url": "https://garden.org/plants/view/720699/"
  },
  {
   "name": "Belosynapsis ciliata",
   "url": "https://garden.org/plants/view/332938/"
  },
  {
   "name": "Bignonia argyreoviolascens",
   "url": "https://garden.org/plants/view/663049/"
  },
  {
   "name": "Billbergia",
   "url": "https://garden.org/plants/view/721632/"
  },
  {
   "name": "Billbergia",
   "url": "https://garden.org/plants/view/721656/"
  },
  {
   "name": "Billbergia",
   "url": "https://garden.org/plants/view/148597/"
  },
  {
   "name": "Billbergia",
   "url": "https://garden.org/plants/view/722334/"
  },
  {
   "name": "Bouvardia",
   "url": "https://garden.org/plants/view/744533/"
  },
  {
   "name": "Calandrinia",
   "url": "https://garden.org/plants/view/677207/"
  },
  {
   "name": "Calathea",
   "url": "https://garden.org/plants/view/678014/"
  },
  {
   "name": "Calathea",
   "url": "https://garden.org/plants/view/701534/"
  },
  {
   "name": "Calliandra riparia",
   "url": "https://garden.org/plants/view/278069/"
  },
  {
   "name": "Callisia cordifolia",
   "url": "https://garden.org/plants/view/204392/"
  },
  {
   "name": "Callisia soconuscensis",
   "url": "https://garden.org/plants/view/333958/"
  },
  {
   "name": "Callisia warszewicziana",
   "url": "https://garden.org/plants/view/333960/"
  },
  {
   "name": "Callisia",
   "url": "https://garden.org/plants/view/641354/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716531/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716536/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716535/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716534/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716533/"
  },
  {
   "name": "Canna",
   "url": "https://garden.org/plants/view/716532/"
  },
  {
   "name": "Ceropegia aperta",
   "url": "https://garden.org/plants/view/476348/"
  },
  {
   "name": "Ceropegia barklyana",
   "url": "https://garden.org/plants/view/116977/"
  },
  {
   "name": "Ceropegia caespitosa subsp. caespitosa",
   "url": "https://garden.org/plants/view/117153/"
  },
  {
   "name": "Ceropegia ciliatula",
   "url": "https://garden.org/plants/view/752136/"
  },
  {
   "name": "Ceropegia cubiformis",
   "url": "https://garden.org/plants/view/120282/"
  },
  {
   "name": "Ceropegia duemmeri",
   "url": "https://garden.org/plants/view/117203/"
  },
  {
   "name": "Ceropegia",
   "url": "https://garden.org/plants/view/677177/"
  },
  {
   "name": "Chamaedorea atrovirens",
   "url": "https://garden.org/plants/view/430773/"
  },
  {
   "name": "Chamaedorea binderi",
   "url": "https://garden.org/plants/view/430860/"
  },
  {
   "name": "Chamaedorea brachyclada",
   "url": "https://garden.org/plants/view/430881/"
  },
  {
   "name": "Chamaedorea carchensis",
   "url": "https://garden.org/plants/view/430912/"
  },
  {
   "name": "Chamaedorea deckeriana",
   "url": "https://garden.org/plants/view/431013/"
  },
  {
   "name": "Chamaedorea macrospadix",
   "url": "https://garden.org/plants/view/431042/"
  },
  {
   "name": "Chamaedorea piscifolia",
   "url": "https://garden.org/plants/view/336089/"
  },
  {
   "name": "Chamaedorea recurvata",
   "url": "https://garden.org/plants/view/431197/"
  },
  {
   "name": "Chamaedorea ricardoi",
   "url": "https://garden.org/plants/view/336090/"
  },
  {
   "name": "Chamaedorea schippii",
   "url": "https://garden.org/plants/view/431232/"
  },
  {
   "name": "Chamaedorea selvae",
   "url": "https://garden.org/plants/view/431246/"
  },
  {
   "name": "Chamaedorea serpens",
   "url": "https://garden.org/plants/view/431247/"
  },
  {
   "name": "Chamaedorea verapazensis",
   "url": "https://garden.org/plants/view/431264/"
  },
  {
   "name": "Chamaedorea warscewiczii",
   "url": "https://garden.org/plants/view/431099/"
  },
  {
   "name": "Chamaedorea",
   "url": "https://garden.org/plants/view/741428/"
  },
  {
   "name": "Chirita atropurpurea",
   "url": "https://garden.org/plants/view/217094/"
  },
  {
   "name": "Chirita bogneriana",
   "url": "https://garden.org/plants/view/218625/"
  },
  {
   "name": "Chirita drakei",
   "url": "https://garden.org/plants/view/217154/"
  },
  {
   "name": "Chirita liboensis",
   "url": "https://garden.org/plants/view/217015/"
  },
  {
   "name": "Chirita lutea",
   "url": "https://garden.org/plants/view/218672/"
  },
  {
   "name": "Chirita minutimaculata",
   "url": "https://garden.org/plants/view/217101/"
  },
  {
   "name": "Chirita ophiopogoides",
   "url": "https://garden.org/plants/view/217290/"
  },
  {
   "name": "Chirita swinglei",
   "url": "https://garden.org/plants/view/217203/"
  },
  {
   "name": "Chirita tribracteata",
   "url": "https://garden.org/plants/view/217109/"
  },
  {
   "name": "Chirita wentsaii",
   "url": "https://garden.org/plants/view/217149/"
  },
  {
   "name": "Chirita",
   "url": "https://garden.org/plants/view/122586/"
  },
  {
   "name": "Chrysanthemum",
   "url": "https://garden.org/plants/view/756917/"
  },
  {
   "name": "Clitoria ternatea",
   "url": "https://garden.org/plants/view/735433/"
  },
  {
   "name": "Codonanthe",
   "url": "https://garden.org/plants/view/697261/"
  },
  {
   "name": "Columnea crassifolia",
   "url": "https://garden.org/plants/view/217846/"
  },
  {
   "name": "Columnea glabra",
   "url": "https://garden.org/plants/view/218092/"
  },
  {
   "name": "Columnea orientandina",
   "url": "https://garden.org/plants/view/218148/"
  },
  {
   "name": "Columnea",
   "url": "https://garden.org/plants/view/155406/"
  },
  {
   "name": "Columnea",
   "url": "https://garden.org/plants/view/645072/"
  },
  {
   "name": "Columnea",
   "url": "https://garden.org/plants/view/744606/"
  },
  {
   "name": "Columnea",
   "url": "https://garden.org/plants/view/744609/"
  },
  {
   "name": "Columnea",
   "url": "https://garden.org/plants/view/744610/"
  },
  {
   "name": "Conophytum meyeri",
   "url": "https://garden.org/plants/view/380782/"
  },
  {
   "name": "Corallocarpus boehmii",
   "url": "https://garden.org/plants/view/381021/"
  },
  {
   "name": "Corallocarpus wildii",
   "url": "https://garden.org/plants/view/699764/"
  },
  {
   "name": "Cordyline",
   "url": "https://garden.org/plants/view/753078/"
  },
  {
   "name": "Cordyline",
   "url": "https://garden.org/plants/view/706976/"
  },
  {
   "name": "Crassula exilis subsp. picturata",
   "url": "https://garden.org/plants/view/382484/"
  },
  {
   "name": "Crassula nudicaulis var. platyphylla",
   "url": "https://garden.org/plants/view/587910/"
  },
  {
   "name": "Crassula ovata",
   "url": "https://garden.org/plants/view/547239/"
  },
  {
   "name": "Crassula umbellata",
   "url": "https://garden.org/plants/view/382616/"
  },
  {
   "name": "Crassula",
   "url": "https://garden.org/plants/view/764366/"
  },
  {
   "name": "Crassula",
   "url": "https://garden.org/plants/view/588616/"
  },
  {
   "name": "Crassula",
   "url": "https://garden.org/plants/view/87811/"
  },
  {
   "name": "Cryptanthus",
   "url": "https://garden.org/plants/view/148755/"
  },
  {
   "name": "Cryptanthus",
   "url": "https://garden.org/plants/view/134363/"
  },
  {
   "name": "Curio citriformis",
   "url": "https://garden.org/plants/view/244632/"
  },
  {
   "name": "Cyanotis robusta",
   "url": "https://garden.org/plants/view/337160/"
  },
  {
   "name": "Dieterlea maxima",
   "url": "https://garden.org/plants/view/408584/"
  },
  {
   "name": "Dischidia oiantha",
   "url": "https://garden.org/plants/view/390353/"
  },
  {
   "name": "Dischidia",
   "url": "https://garden.org/plants/view/717480/"
  },
  {
   "name": "Dischidiopsis parasitica",
   "url": "https://garden.org/plants/view/390403/"
  },
  {
   "name": "Disocactus",
   "url": "https://garden.org/plants/view/649291/"
  },
  {
   "name": "Dorstenia barnimiana",
   "url": "https://garden.org/plants/view/391201/"
  },
  {
   "name": "Doryopteris cordifolia",
   "url": "https://garden.org/plants/view/631594/"
  },
  {
   "name": "Dracaena cambodiana",
   "url": "https://garden.org/plants/view/413974/"
  },
  {
   "name": "Dracaena fragrans",
   "url": "https://garden.org/plants/view/646420/"
  },
  {
   "name": "Dracaena fragrans",
   "url": "https://garden.org/plants/view/645187/"
  },
  {
   "name": "Dracaena marginata",
   "url": "https://garden.org/plants/view/741454/"
  },
  {
   "name": "Dracaena marginata",
   "url": "https://garden.org/plants/view/660615/"
  },
  {
   "name": "Dracaena reflexa",
   "url": "https://garden.org/plants/view/645358/"
  },
  {
   "name": "Dracaena surculosa var. surculosa",
   "url": "https://garden.org/plants/view/415695/"
  },
  {
   "name": "Dracaena surculosa var. surculosa",
   "url": "https://garden.org/plants/view/588243/"
  },
  {
   "name": "Dracaena",
   "url": "https://garden.org/plants/view/612275/"
  },
  {
   "name": "Dracaena",
   "url": "https://garden.org/plants/view/699819/"
  },
  {
   "name": "Duvernoia extensa",
   "url": "https://garden.org/plants/view/336125/"
  },
  {
   "name": "Dyckia",
   "url": "https://garden.org/plants/view/145296/"
  },
  {
   "name": "Ecbolium viride",
   "url": "https://garden.org/plants/view/392695/"
  },
  {
   "name": "Echeveria",
   "url": "https://garden.org/plants/view/117611/"
  },
  {
   "name": "Echeveria",
   "url": "https://garden.org/plants/view/111967/"
  },
  {
   "name": "Echeveria",
   "url": "https://garden.org/plants/view/127985/"
  },
  {
   "name": "Echeveria",
   "url": "https://garden.org/plants/view/610758/"
  },
  {
   "name": "Echeveria",
   "url": "https://garden.org/plants/view/165620/"
  },
  {
   "name": "Elatostema sessile",
   "url": "https://garden.org/plants/view/394317/"
  },
  {
   "name": "Epiphyllum",
   "url": "https://garden.org/plants/view/704196/"
  },
  {
   "name": "Epiphyllum",
   "url": "https://garden.org/plants/view/736898/"
  },
  {
   "name": "Epipremnum giganteum",
   "url": "https://garden.org/plants/view/451512/"
  },
  {
   "name": "Epipremnum pinnatum",
   "url": "https://garden.org/plants/view/701215/"
  },
  {
   "name": "Epipremnum",
   "url": "https://garden.org/plants/view/646645/"
  },
  {
   "name": "Episcia cupreata",
   "url": "https://garden.org/plants/view/778641/"
  },
  {
   "name": "Episcia fimbriata",
   "url": "https://garden.org/plants/view/217565/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/155440/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744611/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/541776/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661315/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661296/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/172267/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744612/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778382/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778526/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744613/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661533/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661298/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661297/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/541927/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/175732/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/155441/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661302/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778525/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661311/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/541926/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744614/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661299/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661312/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744615/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661300/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744616/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744617/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744618/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744619/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/155446/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744620/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778524/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778523/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744621/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/711458/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/172251/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661305/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661304/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661301/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661306/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/744622/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/778522/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661313/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/170481/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661307/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661308/"
  },
  {
   "name": "Episcia",
   "url": "https://garden.org/plants/view/661309/"
  },
  {
   "name": "Eucodonia andrieuxii",
   "url": "https://garden.org/plants/view/217477/"
  },
  {
   "name": "Eucodonia verticillata",
   "url": "https://garden.org/plants/view/238055/"
  },
  {
   "name": "Eucodonia",
   "url": "https://garden.org/plants/view/662519/"
  },
  {
   "name": "Eugenia neomyrtifolia",
   "url": "https://garden.org/plants/view/453607/"
  },
  {
   "name": "Euodia hortensis",
   "url": "https://garden.org/plants/view/398731/"
  },
  {
   "name": "Fatsia japonica",
   "url": "https://garden.org/plants/view/707258/"
  },
  {
   "name": "Faucaria tuberculosa",
   "url": "https://garden.org/plants/view/117554/"
  },
  {
   "name": "Faucaria",
   "url": "https://garden.org/plants/view/242248/"
  },
  {
   "name": "Ficus benjamina",
   "url": "https://garden.org/plants/view/716649/"
  },
  {
   "name": "Ficus benjamina",
   "url": "https://garden.org/plants/view/587616/"
  },
  {
   "name": "Ficus benjamina",
   "url": "https://garden.org/plants/view/676111/"
  },
  {
   "name": "Ficus benjamina",
   "url": "https://garden.org/plants/view/676110/"
  },
  {
   "name": "Ficus benjamina",
   "url": "https://garden.org/plants/view/587617/"
  },
  {
   "name": "Ficus binnendijkii",
   "url": "https://garden.org/plants/view/399494/"
  },
  {
   "name": "Ficus elastica",
   "url": "https://garden.org/plants/view/778932/"
  },
  {
   "name": "Ficus elastica",
   "url": "https://garden.org/plants/view/546273/"
  },
  {
   "name": "Ficus elastica",
   "url": "https://garden.org/plants/view/778933/"
  },
  {
   "name": "Ficus microcarpa",
   "url": "https://garden.org/plants/view/716748/"
  },
  {
   "name": "Ficus",
   "url": "https://garden.org/plants/view/671685/"
  },
  {
   "name": "Fockea comaru",
   "url": "https://garden.org/plants/view/400449/"
  },
  {
   "name": "Gardenia actinocarpa",
   "url": "https://garden.org/plants/view/457584/"
  },
  {
   "name": "Gardenia anapetes",
   "url": "https://garden.org/plants/view/457585/"
  },
  {
   "name": "Gardenia angkorensis",
   "url": "https://garden.org/plants/view/457586/"
  },
  {
   "name": "Gardenia annamensis",
   "url": "https://garden.org/plants/view/457588/"
  },
  {
   "name": "Gardenia aqualla",
   "url": "https://garden.org/plants/view/457589/"
  },
  {
   "name": "Gardenia archboldiana",
   "url": "https://garden.org/plants/view/457590/"
  },
  {
   "name": "Gardenia artensis",
   "url": "https://garden.org/plants/view/457592/"
  },
  {
   "name": "Gardenia aubryi",
   "url": "https://garden.org/plants/view/457593/"
  },
  {
   "name": "Gardenia barnesii",
   "url": "https://garden.org/plants/view/457594/"
  },
  {
   "name": "Gardenia beamanii",
   "url": "https://garden.org/plants/view/422441/"
  },
  {
   "name": "Gardenia boninensis",
   "url": "https://garden.org/plants/view/457595/"
  },
  {
   "name": "Gardenia brachythamnus",
   "url": "https://garden.org/plants/view/457596/"
  },
  {
   "name": "Gardenia buffalina",
   "url": "https://garden.org/plants/view/457597/"
  },
  {
   "name": "Gardenia cambodiana",
   "url": "https://garden.org/plants/view/457598/"
  },
  {
   "name": "Gardenia candida",
   "url": "https://garden.org/plants/view/457599/"
  }
 ]




def scrape(url)
  doc = Nokogiri::HTML(open(url))
  table = doc.at("table")
  hash = {}
  hash["latin_name"] = doc.at("h1").content
  #byebug
  if table.key?("simple-table")
    table.search('tr').each do |tr|
      a = tr.content.split(':')[0]
      b = tr.content.split(":")[1]
      hash[a.strip.gsub(" ","_").downcase] = b.strip.gsub("\n", ". ")
    end
  end

  hash
end

def runScrape
  results = []
  Plants.each do |plant|
    puts plant[:url]
    data = scrape(plant[:url])
    results.push(data)
  end
  results
end

puts runScrape
