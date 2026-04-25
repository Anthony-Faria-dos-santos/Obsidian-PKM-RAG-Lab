# Règles de rédaction

Ces règles s'appliquent au code, à la doc, aux clusters générés. Pas négociables. Une violation, c'est un rejet.

## Langue et typographie

- FR uniquement. Tous les accents présents : é, è, ê, ë, à, â, ù, û, ô, î, ï, ç. Majuscules accentuées (É, À, Ç) incluses.
- **Zéro tiret cadratin** (em-dash `—`, U+2014) ni demi-cadratin (`–`, U+2013). On remplace par virgule, parenthèse, deux-points, ou tiret simple.
- Espaces insécables avant `:`, `;`, `!`, `?`, `»` et après `«`, en contexte FR formel.
- Guillemets français `« »` en FR. Pas de `""` anglais.
- Dates : `22 mars 2026` ou `22/03/2026`. Pas `March 22, 2026`.

## Hiérarchie des outils

Pour toute recommandation d'outil ou de service :

1. **Edu** d'abord (plans étudiants, GitHub Student Pack, Microsoft Learn, AWS Educate, etc.).
2. **Open Source** ensuite (auto-hébergeable, code lisible).
3. **Commercial** en dernier recours.

À chaque outil mentionné, son type entre parenthèses : `(OSS)`, `(Edu)`, `(commercial)`, `(gratuit)`, `(GitHub Student Pack)`. Pas d'ambiguïté.

Minimum deux à trois alternatives par recommandation, triées par fiabilité réelle. Pas par hype, pas par ordre alphabétique.

## Patterns bannis

Vocabulaire à proscrire dans tout livrable :

- `s'avérer`, `mettre en lumière`, `mettre en exergue`, `appréhender` (au sens de comprendre)
- `constituer un enjeu majeur`, `revêtir une importance`
- `il convient de souligner`, `force est de constater`
- `dans un monde en constante évolution`, `à l'ère du numérique`, `dans le paysage actuel`
- `en somme`, `in fine`, `il va sans dire`
- `au sein de` (en suremploi)

Patterns de phrases interdits :

- « X joue un rôle clé/essentiel dans Y »
- « Cela permet non seulement de X mais aussi de Y »
- « X est au cœur de Y »
- Cascade « Cependant / Par ailleurs / En outre / De plus / Néanmoins »

## Adjectifs et adverbes limités

Max une occurrence par 500 mots : `crucial`, `fondamental`, `indispensable`, `incontournable`, `primordial`, `considérable`, `véritablement`, `indéniablement`, `particulièrement`, `essentiel`, `remarquable`.

## Calques anglais à corriger

| Interdit | Correct |
|----------|---------|
| ça fait sens | c'est cohérent |
| adresser un problème | traiter un problème |
| implémenter | mettre en œuvre, intégrer, coder |
| supporter (au sens prendre en charge) | prendre en charge |
| impacter | affecter, toucher |

## Style

- Ton direct. Imperatif ou descriptif. Pas de « Je vais... », « Dans cet article on verra... ».
- Pas de self-promo, pas de mention du modèle qui a généré le contenu.
- Pas d'emojis dans les contenus de cluster, sauf checkboxes (`[ ]`) ou indicateurs de signalisation tolérés par le template d'origine.
- Code blocks avec syntax highlighting explicite : `bash`, `python`, `yaml`, `powershell`, etc.
- Phrases de longueur variable. Alterner courtes et longues. Pas trois phrases consécutives de même longueur.
