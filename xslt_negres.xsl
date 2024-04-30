<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- INSTRUCTION D'OUTPUT : HTML avec indentation -->
    <xsl:output method="html" indent="yes"/>
    
    
    <!-- DÉCLARATIONS DES VARIABLES -->
    <!-- chemin des fichiers de sortie -->
    
    <!-- variable : home -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('negres_home','.html')"/>
    </xsl:variable>
    <!-- variable : chap1 -->
    <xsl:variable name="chap1">
        <xsl:value-of select="concat('negres_chap1','.html')"/>
    </xsl:variable>
    <!-- variable : chap2 -->
    <xsl:variable name="chap2">
        <xsl:value-of select="concat('negres_chap2','.html')"/>
    </xsl:variable>
    <!-- variable : chap3 -->
    <xsl:variable name="chap3">
        <xsl:value-of select="concat('negres_chap3','.html')"/>
    </xsl:variable>
    <!-- variable : index -->
    <xsl:variable name="index">
        <xsl:value-of select="concat('negres_index','.html')"/>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <HEAD> -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//titleStmt/title[@level='a']"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title[@level='a']"/><xsl:text> par </xsl:text><xsl:value-of select="//titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/respStmt/persName"/>
                </xsl:attribute>
            </meta>
        </head>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer>
            <p><i><xsl:value-of select="//publicationStmt/p"/></i></p>
        </footer>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE CSS DU <BODY> -->
    <xsl:variable name="body_css">
        <xsl:text>
            margin-right: 20%;
            margin-left: 20%;
            margin-top: 6%;
            color: black;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            background-color: peachpuff;
        </xsl:text>
    </xsl:variable>
    
    <!-- VARIABLES AVEC LES LIENS DE RETOUR -->
    <xsl:variable name="return_home">
        <i><a href="{concat('./', $home)}">Revenir à l'accueil</a></i>
    </xsl:variable>
    
    <xsl:variable name="return_index">
        <i><a href="{concat('./', $index)}">Index des noms de lieux et de personnes</a></i>
    </xsl:variable>
    
    <!-- VARIABLE AVEC L'EN-TÊTE DU <BODY> DES PAGES -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%;">
            <h1>Édition en ligne de <i><xsl:value-of select="//titleStmt/title[1]"/></i></h1>
            <h2><xsl:value-of select="//titleStmt/author"/></h2>
            <p>Encodé par <xsl:value-of select="//titleStmt//respStmt/persName"/></p>
        </div>
    </xsl:variable>
    
    <!-- FIN DES DÉCLARATIONS DES VARIABLES -->
    
    <!-- TEMPLATE MATCH SUR LA RACINE AVEC LES CALL TEMPLATES DES PAGES-->
    <!-- Création des templates pour "home", "chap1", "chap2", "chap3", et "index" -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapter1"/>
        <xsl:call-template name="chapter2"/>
        <xsl:call-template name="chapter3"/>
        <xsl:call-template name="index_negres"/>
    </xsl:template>
    
    <!-- TEMPLATE DE LA PAGE HOME -->
    <!-- Présentation classique d'une page HTML -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">  
                        <!-- Description du livre dans la partie home -->
                        <h3 style="text-align: center;"><b>Présentation<br/></b></h3> 
                        <p>Écrit pendant la période coloniale française, <xsl:value-of select="//titleStmt/title[1]"/> de <xsl:value-of select="//titleStmt/author"/> conserve les caractéristiques historiques des textes que nous pouvons regrouper sous l'appellation d'écrits ethnographiques, dont l'objectif principal était de tenter de décrire les populations locales, ainsi que leurs potentialités (économie, faune et flore). Les trois chapitres sélectionnés traitent principalement de questions ethnographiques. À partir de ces descriptions, nous pouvons comprendre comment s'est opérée la construction historique de l'imaginaire sur les populations autochtones du continent africain et, de plus, l'écriture même de l'histoire africaine. Ces interprétations, bien qu'elles demeurent la vision du colon, n'en restent pas moins intéressantes pour comprendre ce que le philosophe congolais Valentin-Yves Mudimbe appelle "l'invention de l'Afrique".</p>
                    </div>
                    <div>
                        <!-- Définition du pied de page afin de pouvoir naviguer entre les pages mentionnées ci-dessous -->
                        <p><a href="./{$chap1}">Chapitre 1</a> – <a href="./{$chap2}">Chapitre 2</a> – <a href="./{$chap3}">Chapitre 3</a> – <a href="./{$index}">Index des noms de lieux et de personnes.</a></p>
                    </div>
                    <!-- copie du footer défini en haut -->
                    <xsl:copy-of select="$footer"/> 
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 1 -->
    <!-- Présentation classique d'une page HTML -->
    <xsl:template name="chapter1">
        <xsl:result-document href="{$chap1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <!-- Récupére le nom du premier livre de l'ouvrage -->
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text[1]/body[1]/div[1]/head[1]"/></h3>
                        <!-- Récupére le titre du chapitre correspondant au livre mentionné ci-dessous -->
                        <h4 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//div[@type='chapter']/head[@type='titre_chap']"/></h4>
                        <xsl:apply-templates select="./TEI/text"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text">
        <div style="text-align: justify;">
            <xsl:for-each select="//div[@n='1']/p">
                <!-- boucle afin de reproduire chaque <p> séparément -->
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <p>>> <a href="./{$chap2}">Chapitre suivant.</a></p>
            <xsl:copy-of select="$return_home"/> – <xsl:copy-of select="$return_index"/>
        </div>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 2 -->
    <!-- Présentation classique d'une page HTML -->
    <xsl:template name="chapter2">
        <xsl:result-document href="{$chap2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">
                        <!-- Récupére le nom du premier livre de l'ouvrage -->
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text[1]/body[1]/div[1]/head[1]"/></h3>
                        <!-- Récupére le titre du chapitre correspondant au livre mentionné ci-dessous -->
                        <h4 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="/TEI/text[1]/body[1]/div[1]/div[2]/head[1]"/></h4>
                        <!-- ajout d'un @mode pour différencier le traitement du texte -->
                        <!-- texte du chapitre 2 de celui du chapitre 1 -->
                        <xsl:apply-templates select="./TEI/text" mode="chapter2"/>
                        
                        
                        <p>>> <a href="./{$chap1}">Chapitre précédent.</a></p>
                        <p>>> <a href="./{$chap3}">Chapitre suivant.</a></p>
                        <xsl:copy-of select="$return_home"/> - <xsl:copy-of select="$return_index"/>
                    </div>
                    
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text" mode="chapter2">
        <xsl:for-each select="//div[@n='2']/p">
            <!-- boucle afin de reproduire chaque <p> séparément -->
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 3 -->
    <!-- Présentation classique d'une page HTML -->
    <xsl:template name="chapter3">
        <xsl:result-document href="{$chap3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">
                        <!-- Récupére le nom du deuxième livre de l'ouvrage -->
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="/TEI/text[1]/body[1]/div[2]/head[1]"/></h3>
                        <!-- Récupére le nom du premier livre -->
                        <h4 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="/TEI/text[1]/body[1]/div[2]/div[1]/head[1]"/></h4>
                        <!-- ajout d'un @mode pour différencier le traitement du texte -->
                        <!-- texte du chapitre 3 de celui du chapitre 1 -->
                        <xsl:apply-templates select="./TEI/text" mode="chapter3"/>
                        
                        
                        <p>>> <a href="./{$chap2}">Chapitre précédent.</a></p>
                        <xsl:copy-of select="$return_home"/> - <xsl:copy-of select="$return_index"/>
                    </div>
                    
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text" mode="chapter3">
        <xsl:for-each select="//div[@n='3']/p">
            <!-- boucle afin de reproduire chaque <p> séparément -->
            <p><xsl:apply-templates/></p>
        </xsl:for-each>
    </xsl:template>
     
    <!-- TEMPLATES DE LA PAGE INDEX -->
    <!-- Présentation classique d'une page HTML -->
    <xsl:template name="index_negres">
        <xsl:result-document href="{$index}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <!-- BOUCLE N°1 -->
                        <!--liste pour placeName, persName, nationality-->
                        <!-- Grouper les éléments de la liste par name()-->
                        <xsl:for-each-group select="//text//*[self::placeName or self::persName or self::nationality]" group-by="name()">
                            <div>
                                <!-- Utilisation de xsl:choose pour sélectionner le label en fonction du type d'élément -->
                                    <xsl:choose>
                                        <xsl:when test="name() = 'persName'">
                                        <h3>Index des noms de personnes</h3>
                                        </xsl:when>
                                        <xsl:when test="name() = 'nationality'">
                                            <h3>Index des noms de groupes ethniques</h3>
                                        </xsl:when>
                                        <xsl:when test="name() = 'placeName'">
                                            <h3>Index des noms de lieux</h3>
                                        </xsl:when>
                                    </xsl:choose>
                                
                                <!-- BOUCLE N°2 : créer un seul <p> par entrée d'index -->
                                <xsl:for-each-group select="current-group()" group-by=".">
                                    <p><i><xsl:value-of select="."/></i> :
                                        <!-- BOUCLE N°3 : ajouter le n° de la ou des <div> où apparaissent les entrées d'index -->
                                        <xsl:for-each-group select="current-group()" group-by="ancestor::div">
                                            <a>
                                                <xsl:attribute name="href">
                                                    <xsl:choose>
                                                        <xsl:when test="ancestor::div/@n = '1'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$chap1"/>
                                                        </xsl:when>
                                                        <xsl:when test="ancestor::div/@n = '1'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$chap2"/>
                                                        </xsl:when>
                                                        <xsl:when test="ancestor::div/@n = '2'">
                                                            <xsl:text>./</xsl:text><xsl:value-of select="$chap3"/>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of select="ancestor::div/@n"/>
                                            </a>
                                            <xsl:if test="position()!= last()">, 
                                            </xsl:if><xsl:if test="position() = last()">.</xsl:if>
                                        </xsl:for-each-group>
                                    </p>
                                </xsl:for-each-group>
                            </div>
                        </xsl:for-each-group>
                        <p><xsl:copy-of select="$return_home"/> – <a href="./{$chap1}">Chapitre 1</a> – <a href="./{$chap2}">Chapitre 2</a> - <a href="./{$chap3}">Chapitre 3</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- CHAPITRES 1, 2 e 3 -->
    <!-- transformation de tous les <hi> en <em> -->
    <xsl:template match="//body//hi">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <!-- transformation de tous les <title> en <em> -->
    <xsl:template match="//body//title">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <!-- cacher les <note> avec la transformation -->
    <xsl:template match="//body//note">
        <!-- Ce modèle est vide, donc les notes ne seront pas traitées -->
    </xsl:template>
    
</xsl:stylesheet>