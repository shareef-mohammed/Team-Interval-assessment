const db = require('../connectdb/connectdb');

const tableName1 = 'articles'

const tableQuery1 = `CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    heading VARCHAR(255) NOT NULL,
    readTime INT NOT NULL,
    description TEXT NOT NULL,
    categories VARCHAR(255) NOT NULL,
    thumbnailImage VARCHAR(255) NOT NULL,
    featuredImage VARCHAR(255) NOT NULL,
    verified BOOLEAN DEFAULT 0,
    newest BOOLEAN DEFAULT 0,
    trending BOOLEAN DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)`

const tableName2 = 'categories'

const tableQuery2 = `CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)`

module.exports.postArticle = async (req, res) => {
    try {
        db.query(`SHOW TABLES LIKE '${tableName1}'`, (error, results, fields) => {
            if (error) {
              console.error(error);
            } else {
              if (results.length > 0) {
                console.log(`Table ${tableName1} exists`);
              } else {
                db.query(tableQuery1, (err, result) => {
                    if(err) throw err
                    console.log('table created succesfully')
                })
              }
            }
        });
        const { heading, readTime, description, thumbnailImage, featuredImage, verified, newest, trending } = req.body;
        const categoriesArray = []
        categoriesArray.push(req.body.categories)
        const categories = JSON.stringify(categoriesArray);
        const article = { heading, readTime, description, categories, thumbnailImage, featuredImage, verified, newest, trending };

        db.query('INSERT INTO articles SET ?', article, (err, result) => {
            if(err) throw err;
            console.log(`Article with ID ${result.insertId} created.`);
            res.status(200).json({articleId: result.insertId});
        });

    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.createCategory = async (req, res) => {
    try {
        db.query(`SHOW TABLES LIKE '${tableName2}'`, (error, results, fields) => {
            if (error) {
              console.error(error);
            } else {
              if (results.length > 0) {
                console.log(`Table ${tableName2} exists`);
              } else {
                db.query(tableQuery2, (err, result) => {
                    if(err) throw err
                    console.log('table created succesfully')
                })
              }
            }
        });
        const { category } = req.body;
        db.query('INSERT INTO categories SET ?', {category}, (err, result) => {
            if(err) throw err;
            console.log(`Category with ID ${result.insertId} created.`);
            res.status(200).json({categoryId: result.insertId});
        });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.getCategories = async (req, res) => {
    try {
        db.query('SELECT * FROM categories', (err, results) => {
            if (err) throw err;
            res.json(results);
          });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.getArticles = async (req, res) => {
    try {
        db.query('SELECT * FROM articles', (err, results) => {
            if (err) throw err;
            res.json(results);
        });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.categoryBasedArticles = async(req, res) => {
    try {
        const category = req.params.category;
        let query = 'SELECT * FROM articles WHERE 1=1';
        let params = [];

        if (category && category.length > 0) {
            query += ' AND categories IN (?)';
            params.push(category);
        }   

    db.query(query, params, (err, results) => {
    if (err) throw err;
        res.json(results);
    });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.updateArticle = async(req, res) => {
    try {
        const articleId = req.params.id;
        const { heading, readTime, description, thumbnailImage, featuredImage, verified, newest, trending } = req.body;
        const categoriesArray = []
        categoriesArray.push(req.body.categories)
        const categories = JSON.stringify(categoriesArray);
        const article = { heading, readTime, description, categories, thumbnailImage, featuredImage, verified, newest, trending };

        db.query('UPDATE articles SET ? WHERE id = ?', [article, articleId], (err, result) => {
            if (err) throw err;
            console.log(`Article with ID ${articleId} updated`);
            res.json({ message: `Article with ID ${articleId} updated` });
        });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}

module.exports.deleteArticle = async (req, res) => {
    try {
        const articleId = req.params.id;

        db.query('DELETE FROM articles WHERE id = ?', articleId, (err, result) => {
          if (err) throw err;
          console.log(`Article with ID ${articleId} removed`);
          res.json({ message: `Article with ID ${articleId} removed` });
        });
    } catch (err) {
        res.status(500).send('Internal Server Error.');
    }
}