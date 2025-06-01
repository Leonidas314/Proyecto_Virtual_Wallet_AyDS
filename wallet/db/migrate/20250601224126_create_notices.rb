class CreateNotices < ActiveRecord::Migration[8.0]
  def change
    create_table :notices do |t|
      t.string :title
      t.string :body
      t.timestamps
    end

    Notice.create([
      { title: "Bull market alcanza nuevos máximos", body: "El mercado está en auge y las acciones siguen subiendo." },
      { title: "Nuevas startups emergen con fuerza", body: "La inversión en nuevas empresas tecnológicas se dispara." },
      { title: "Inversionistas celebran récords históricos", body: "El mercado financiero muestra su mejor rendimiento en años." },
      { title: "Criptomonedas en tendencia alcista", body: "El precio del Bitcoin y otras criptos sigue subiendo." },
      { title: "Expansión global de grandes corporaciones", body: "Empresas líderes anuncian nuevas inversiones en mercados emergentes." }
    ])
  end
end
