<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé bancaire</title>
            </head>
            <body>
                <h1>Représentation des données du relevé bancaire:</h1>
                <hr/>
                <h2>Informations du compte:</h2>
                <ul>
                    <li>RIB: <xsl:value-of select="releve/@RIB"/></li>
                    <li>Date du relevé: <xsl:value-of select="releve/dateReleve"/></li>
                    <li>Solde : <xsl:value-of select="releve/solde"/></li>
                    <li>Période: du <xsl:value-of select="releve/operations/@dateDebut"/> au <xsl:value-of select="releve/operations/@dateFin"/></li>
                </ul>
                
                <h2>Liste des opérations:</h2>
                <table border="1" width="90%">
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Montant en MAD (DH)</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@description"/></td>
                            <td><xsl:value-of select="@montant"/></td>  
                        </tr>
                    </xsl:for-each>
                    <td colspan="3"><b>Nombre total d'opérations: </b></td>
                    <td><xsl:value-of select="count(releve/operations/operation)"/></td>
                </table>
                
                <h2>Montant total des crédits et des débits:</h2>
                <table border="1" width="90%">
                    <tr>
                        <th>Type </th>
                        <th>Montant Total en MAD (DH):</th>
                    </tr>
                    <tr>
                        <td>Total des CRÉDITS</td>
                        <td><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></td>
                    </tr>
                    <tr>
                        <td>Total des DÉBITS</td>
                        <td><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/></td>
                    </tr>
                    <tr>
                        <td><b>Solde final</b></td>
                        <td><b><xsl:value-of select="releve/solde"/></b></td>
                    </tr>
                    <tr>
                        <td>Nombre d'opérations CRÉDIT</td>
                        <td><xsl:value-of select="count(releve/operations/operation[@type='CREDIT'])"/></td>
                    </tr>
                    <tr>
                        <td>Nombre d'opérations DÉBIT</td>
                        <td><xsl:value-of select="count(releve/operations/operation[@type='DEBIT'])"/></td>
                    </tr>
                </table>
                
                <h2>Liste des opérations CREDIT:</h2>
                <table border="1" width="90%">
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Montant (DH)</th>
                    </tr>
                    
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@description"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                    
                    <tr>
                        <td colspan="3"><b>Nombre d'opérations CREDIT:</b></td>
                        <td><xsl:value-of select="count(releve/operations/operation[@type='CREDIT'])"/></td>
                    </tr>
                    <tr>
                        <td colspan="3"><b>Total des CRÉDITS:</b></td>
                        <td><b><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH</b></td>
                    </tr>
                </table>
                
                
            </body>
        </html>
        
    </xsl:template>
  
</xsl:stylesheet>