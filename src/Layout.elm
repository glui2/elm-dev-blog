module Layout exposing (view)

import Element exposing (Element, Length)
import Element.Background
import Element.Border
import Element.Font as Font
import Element.Region
import Html exposing (Html)
import Html.Attributes exposing (src)
import Metadata exposing (Metadata)
import Pages
import Pages.Directory as Directory exposing (Directory)
import Pages.ImagePath as ImagePath
import Pages.PagePath as PagePath exposing (PagePath)
import Palette


view :
    { title : String, body : List (Element msg) }
    ->
        { path : PagePath Pages.PathKey
        , frontmatter : Metadata
        }
    -> { title : String, body : Html msg }
view document page =
    { title = document.title
    , body =
        Element.column
            [ Element.width Element.fill ]
            [ header page.path
            , Element.column
                [ Element.padding 30
                , Element.spacing 40
                , Element.Region.mainContent
                , Element.width (Element.fill |> Element.maximum 800)
                , Element.centerX
                ]
                document.body
            ]
            |> Element.layout
                [ Element.width Element.fill
                , Font.size 20
                , Font.family [ Font.typeface "Roboto" ]
                , Font.color (Element.rgba255 0 0 0 0.8)
                ]
    }


header : PagePath Pages.PathKey -> Element msg
header currentPath =
    Element.column [ Element.width Element.fill ]
        [ Element.el
            [ Element.height (Element.px 4)
            , Element.width Element.fill
            , Element.Background.gradient
                { angle = 0.2
                , steps =
                    [ Element.rgb255 0 242 96
                    , Element.rgb255 5 117 230
                    ]
                }
            ]
            Element.none
        , Element.row
            [ Element.paddingXY 25 4
            , Element.spaceEvenly
            , Element.width Element.fill
            , Element.Region.navigation
            , Element.Border.widthEach { bottom = 10, left = 0, right = 0, top = 0 }
            , Element.Border.color (Element.rgba255 255 240 140 1)
            , Element.Background.color (Element.rgba255 255 221 0 1)
            , Element.height (Element.px 75)
            ]
            [ Element.link []
                { url = "/"
                , label =
                    Element.row [ Font.size 30, Element.spacing 16 ]
                        [ Element.image [ Element.width (Element.px 50), Element.Border.rounded 50 ] { src = "images/gavin-icon.jpeg", description = "" }
                        , Element.text "GlueyToo"
                        ]
                }
            , Element.row [ Element.spacing 15 ]
                [ githubRepoLink
                , highlightableLink currentPath Pages.pages.blog.directory "Blog Posts"
                ]
            ]
        ]


highlightableLink :
    PagePath Pages.PathKey
    -> Directory Pages.PathKey Directory.WithIndex
    -> String
    -> Element msg
highlightableLink currentPath linkDirectory displayName =
    let
        isHighlighted =
            currentPath |> Directory.includes linkDirectory
    in
    Element.link
        (if isHighlighted then
            [ Font.underline
            , Font.color Palette.color.primary
            ]

         else
            []
        )
        { url = linkDirectory |> Directory.indexPath |> PagePath.toString
        , label = Element.text displayName
        }


githubRepoLink : Element msg
githubRepoLink =
    Element.newTabLink []
        { url = "https://github.com/glui2"
        , label =
            Element.image
                [ Element.width (Element.px 22)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.github, description = "Github repo" }
        }


elmDocsLink : Element msg
elmDocsLink =
    Element.newTabLink []
        { url = "https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/"
        , label =
            Element.image
                [ Element.width (Element.px 22)
                , Font.color Palette.color.primary
                ]
                { src = ImagePath.toString Pages.images.elmLogo, description = "Elm Package Docs" }
        }
