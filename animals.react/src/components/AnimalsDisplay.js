import React, { useEffect, useState } from 'react';
import { getAllAnimals } from '../utils/animals_api';
import '../styles/index.css';

const AnimalsDisplay = () => {
    const [animals, setAnimals] = useState([]);
    const [plQuestion, setPlQuestion] = useState('En attente de requête...');
    

    useEffect(() => {
        getAllAnimals((animals) => {
            setAnimals(animals)
        });
    }
    , []);
    
    function sendQuery(query) {

        console.log('DEBUG: query', query);
        // fetch(`http://localhost:8008/api/prolog?query=${encodeURIComponent(query)}`)
        //     .then(response => response.json())
        //     .then(data => {
        //         // Assuming the question is returned in the 'question' property of the response
        //         setPlQuestion(data.question);
        //     })
        //     .catch(error => console.error('Error:', error));
    }

    
    return (
        <div className='page_wrapper'>
            <h1 className='page_title'>
                Bienvenue sur akinAnimaux.fr  
            </h1>
            <h2 className='page_subtitle'>
            (Calmons-nous je n'ai pas pris de nom de domaine tout de même !)
            </h2>

            <p>
                Pour trouver l'animal auquel vous pensez, <br/>répondez simplement aux questions suivantes.
                par <span>oui</span> ou par <span>non</span>.
            </p>
            
            <div className='prolog_wrapper'>
                <h2>Question : </h2>
                <h3>{plQuestion}</h3>

                <form>
                <div className='button_wrapper'>
                            <input 
                                className='button_form button_oui'
                                type='button' 
                                value='Oui'
                                onClick={() => sendQuery('oui')}    
                            />
                            <input 
                                className='button_form button_non'
                                type='button' 
                                value='Non'
                                onClick={() => sendQuery('non')}    
                            />

                </div>                

                </form>
            </div>
        </div>
    );
};

export default AnimalsDisplay;